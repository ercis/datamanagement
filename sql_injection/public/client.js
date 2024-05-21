async function loadComments() {
    const response = await fetch("/comment")
    const comments = await response.json()

    console.info(comments)

    const ul = document.querySelector("ul")
    ul.innerHTML = ""
    for (const comment of comments) {
        const li = document.createElement("li")
        li.textContent = comment.content
        ul.appendChild(li)
    }
}

async function addComment() {
    const input = document.querySelector("textarea")
    const content = input.value
    input.value = ""
    await fetch("/comment", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ content }),
    })

    loadComments()
}
