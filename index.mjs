console.log("hello world")

const ws = new WebSocket("ws://localhost:8080/ws/");

ws.addEventListener("open", (event) => {
    setInterval(() => {
        if (Math.random() < 0.1) {
            ws.close();
        }
        ws.send(Math.random());
    }, 2000);
});

ws.addEventListener("message", (event) => {
    console.log(event);
});
