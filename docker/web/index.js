require("http")
  .createServer((_, res) => {
    if (process.env.HOST_NAME == null || process.env.HOST_NAME === "") {
      return res.writeHead(500).end("HOST_NAME is not configured.");
    }

    res.end(`Hello World! This is ${process.env.HOST_NAME}!`);
  })
  .listen(process.env.PORT || "8080");
