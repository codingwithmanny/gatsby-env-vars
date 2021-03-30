import * as React from "react"

import Layout from "../components/layout"
import SEO from "../components/seo"

const IndexPage = () => {
  const [todos, setTodos] = React.useState<[{
  title?: string}] | undefined>()

  React.useEffect(() => {
    fetch(`${window.GATSBY_API_URL}/todos`)
      .then(response => response.json())
      .then(json => setTodos(json))
  }, [])

  return (
    <Layout>
      <SEO title="Home" />
      <h1>Todos</h1>
      {todos && todos.length > 0 && (
        <ul>
          {todos.map((todo, key) => (
            <li key={`todo-${key}`}>{todo?.title}</li>
          ))}
        </ul>
      )}
    </Layout>
  )
}

export default IndexPage
