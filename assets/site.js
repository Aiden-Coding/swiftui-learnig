(function () {
  function buildChapterUrl(path) {
    return "./chapter.html?path=" + encodeURIComponent(path);
  }

  function flattenChapters() {
    return window.TUTORIAL_GROUPS.flatMap(function (group) {
      return group.chapters.map(function (chapter) {
        return Object.assign({ groupTitle: group.title }, chapter);
      });
    });
  }

  function renderHomePage() {
    var trackList = document.getElementById("track-list");
    var chapterGroups = document.getElementById("chapter-groups");

    if (!trackList || !chapterGroups) {
      return;
    }

    window.TUTORIAL_GROUPS.forEach(function (group) {
      var trackCard = document.createElement("article");
      trackCard.className = "track-card";
      trackCard.innerHTML =
        "<h3>" + group.title + "</h3>" +
        "<p>" + group.description + "</p>" +
        "<a class=\"text-link\" href=\"" + buildChapterUrl(group.chapters[0].path) + "\">从这一阶段开始 →</a>";
      trackList.appendChild(trackCard);

      var groupSection = document.createElement("section");
      groupSection.className = "chapter-group";

      var heading = document.createElement("div");
      heading.className = "chapter-group__heading";
      heading.innerHTML = "<h3>" + group.title + "</h3><p>" + group.description + "</p>";
      groupSection.appendChild(heading);

      var list = document.createElement("div");
      list.className = "chapter-card-list";

      group.chapters.forEach(function (chapter) {
        var card = document.createElement("a");
        card.className = "chapter-card";
        card.href = buildChapterUrl(chapter.path);
        card.innerHTML =
          "<span class=\"chapter-card__number\">" + String(chapter.number).padStart(2, "0") + "</span>" +
          "<strong>" + chapter.title + "</strong>";
        list.appendChild(card);
      });

      groupSection.appendChild(list);
      chapterGroups.appendChild(groupSection);
    });
  }

  function renderMarkdownPage() {
    var contentNode = document.getElementById("chapter-content");
    var navNode = document.getElementById("chapter-nav");
    var titleNode = document.getElementById("chapter-title");
    var metaNode = document.getElementById("chapter-meta");

    if (!contentNode || !navNode || !titleNode || !metaNode) {
      return;
    }

    var params = new URLSearchParams(window.location.search);
    var path = params.get("path");
    var allChapters = flattenChapters();
    var current = allChapters.find(function (chapter) {
      return chapter.path === path;
    });

    if (!path || !current) {
      titleNode.textContent = "未找到章节";
      metaNode.textContent = "请返回首页重新选择章节。";
      contentNode.innerHTML = "<p>没有读取到有效章节路径。</p>";
      return;
    }

    titleNode.textContent = current.title;
    metaNode.textContent = current.groupTitle + " · 第 " + String(current.number).padStart(2, "0") + " 章";

    allChapters.forEach(function (chapter) {
      var link = document.createElement("a");
      link.href = buildChapterUrl(chapter.path);
      link.className = "chapter-nav__item" + (chapter.path === current.path ? " is-active" : "");
      link.textContent = String(chapter.number).padStart(2, "0") + " " + chapter.title;
      navNode.appendChild(link);
    });

    fetch(path)
      .then(function (response) {
        if (!response.ok) {
          throw new Error("章节读取失败");
        }
        return response.text();
      })
      .then(function (markdown) {
        var cleaned = markdown.replace(/^#\s+.+$/m, "").trim();
        var html = window.marked.parse(cleaned);
        contentNode.innerHTML = window.DOMPurify.sanitize(html);
      })
      .catch(function () {
        contentNode.innerHTML = "<p>章节内容读取失败，请稍后再试。</p>";
      });
  }

  renderHomePage();
  renderMarkdownPage();
})();
