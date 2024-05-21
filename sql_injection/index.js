import express from "express"
import * as db from "./db.js"
const app = express()
const port = 3000

app.use(express.json())
app.use(express.static("public"))

app.get("/comment", async (_, response) => {
    console.info("GET /comment")
    response.send(JSON.stringify(await db.getAllComments()))
})

app.post("/comment", async (request, response) => {
    console.info("POST /comment")
    const content = request.body.content
    console.log(content)

    await db.insertComment(content)

    response.sendStatus(201)
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
