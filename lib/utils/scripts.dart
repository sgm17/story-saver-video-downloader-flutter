const onScrollChangedScript = """
  (function() {
      return window.scrollY;
  })()
""";

const onUpdateVisitedHistoryInitialYPosScript = """
  (function() {
      const element = document.querySelector("main > div > div:nth-child(4)");
      if (element) {
          const yPos = element.getBoundingClientRect().top + window.scrollY;
          return yPos
      }
  })()
""";
