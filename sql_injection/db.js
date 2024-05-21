import pg from "pg"
const { Client } = pg

const client = new Client({
    user: "postgres",
    password: "postgres",
    host: "localhost",
    port: 5432,
    database: "postgres",
})

await client.connect()

await client.query(`
    DROP TABLE IF EXISTS comment;
    CREATE TABLE comment (
        content TEXT
    );
`)

export async function getAllComments() {
    const response = await client.query("SELECT * FROM comment;")
    console.info(response.rows)
    return response.rows
}

export async function insertComment(content) {
    const myQuery = "INSERT INTO comment VALUES ('" + content + "');"
    await client.query(myQuery)
}

// hello'); DELETE FROM comment; INSERT INTO comment VALUES ('Hacked!

// Prepared Statements (Escape dangerous characters)
// export async function insertComment(content) {
//     await client.query("INSERT INTO comment VALUES ($1);", [content])
// }
