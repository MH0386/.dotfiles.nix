import type { Plugin, Hooks } from "@opencode-ai/plugin"

export const MyPlugin: Plugin = async () => {
  return {
    "experimental.text.complete": async (output: { text: string }) => {
      if (typeof output.text !== "string") return;

      try {
        output.text = formatGithubSuggestions(output.text)
      } catch (error) {
        // If formatting fails, keep original md text
        output.text = output.text + "\n\n<!-- Github suggestions formatting failed: " + (error as Error).message + " -->"
      }
    },
  } as Hooks
}

function formatGithubSuggestions(text: string): string {
  // Match code blocks with diff language: ```diff ... ```
  // Using [\r\n]+ to handle different line endings (LF, CRLF)
  const diffBlockRegex = /```diff[\r\n]+([\s\S]*?)```/g;

  return text.replace(diffBlockRegex, (match, diffContent) => {
    // Normalize line endings to \n for consistent splitting
    const normalizedContent = diffContent.replace(/\r\n/g, '\n');
    const lines = normalizedContent.split('\n');
    const suggestionLines: string[] = [];

    for (const line of lines) {
      // Skip empty lines and diff metadata lines (---, +++, @@)
      if (!line.trim() || line.startsWith('---') || line.startsWith('+++') || line.startsWith('@@')) {
        continue;
      }
      // Keep lines starting with + (added lines), removing the + prefix
      if (line.startsWith('+')) {
        suggestionLines.push(line.slice(1));
      }
    }

    if (suggestionLines.length === 0) {
      return match; // Return original if no suggestions found
    }

    return '```suggestion\n' + suggestionLines.join('\n') + '\n```';
  });
}
