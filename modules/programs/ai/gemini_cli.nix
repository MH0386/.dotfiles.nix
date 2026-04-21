{
  den.default = {
    homeManager = {
      programs.gemini-cli = {
        enable = true;
        enableMcpIntegration = true;
        settings = {
          security = {
            auth = {
              selectedType = "oauth-personal";
            };
            enablePermanentToolApproval = true;
            environmentVariableRedaction = {
              enabled = true;
            };
          };
          ide = {
            hasSeenNudge = true;
            enabled = true;
          };
          general = {
            enableNotifications = true;
            debugKeystrokeLogging = true;
          };
          ui = {
            inlineThinkingMode = "full";
            showStatusInTitle = true;
            footer = {
              hideContextPercentage = false;
            };
            showCitations = true;
            showModelInfoInChat = true;
            loadingPhrases = "all";
          };
          context = {
            fileName = [
              "AGENTS.md"
              "CONTEXT.md"
              "GEMINI.md"
            ];
            loadMemoryFromIncludeDirectories = true;
          };
          tools = {
            sandbox = "podman"; # "runsc";
            shell = {
              enableInteractiveShell = true;
              showColor = true;
            };
          };
          advanced = {
            autoConfigureMemory = true;
          };
          experimental = {
            worktrees = true;
            modelSteering = true;
            memoryManager = true;
            contextManagement = true;
            topicUpdateNarration = true;
          };
        };
      };
    };
  };
}
