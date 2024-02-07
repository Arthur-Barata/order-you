import dotenv from "dotenv";
import express from "express";
dotenv.config();
const app = express();
const port = process.env.PORT;
app.get("/", (req, res) => {
    res.send("<h1>server is running now</h1>");
});
app.listen(port, () => {
    console.log(`server is running on port ${port}`);
});
