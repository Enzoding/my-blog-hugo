window.CMS_MANUAL_INIT = true;

CMS.init({
  config: {
    backend: {
      name: 'github',
      repo: 'Enzoding/my-blog-hugo',
      branch: 'main',
      base_url: 'https://my-blog-hugo-one.vercel.app',
      auth_endpoint: 'auth'
    },
    media_folder: "static/images",
    public_folder: "/images",
    collections: [
      {
        name: "posts",
        label: "文章",
        folder: "content/posts",
        create: true,
        slug: "{{year}}-{{month}}-{{day}}-{{slug}}",
        editor: {
          preview: true
        },
        fields: [
          {label: "标题", name: "title", widget: "string"},
          {label: "摘要", name: "summary", widget: "string"},
          {label: "发布日期", name: "date", widget: "datetime"},
          {label: "作者", name: "author", widget: "string"},
          {label: "分类", name: "categories", widget: "list"},
          {label: "标签", name: "tags", widget: "list"},
          {label: "显示目录", name: "showToc", widget: "boolean", default: true},
          {label: "目录默认展开", name: "TocOpen", widget: "boolean", default: false},
          {label: "草稿", name: "draft", widget: "boolean", default: false},
          {label: "隐藏元信息", name: "hidemeta", widget: "boolean", default: false},
          {label: "允许评论", name: "comments", widget: "boolean", default: false},
          {label: "正文", name: "body", widget: "markdown"}
        ]
      }
    ]
  }
});
