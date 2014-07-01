import Http
import Http (..)

render : State -> Html
render state =
    node "div"
      [ "className" := "todomvc-wrapper" ]
      [ "visibility" := "hidden" ]
      [ node "link"
          [ rel := "stylesheet"
          , href := "/mercury/examples/todomvc/style.css"
          ]
          []
          []
      , node "section"
          [ "id" := "todoapp.todoapp" ]
          []
          [ mercury.partial(header, state.field, state.events)
          , mainSection(state.todos, state.route, state.events)
          , mercury.partial(statsSection,
                state.todos, state.route, state.events)
          ]
      , mercury.partial(infoFooter)
      ]

header field events =
    node "header" 
      [ "id" := "header.header" ]
        "ev-event": [
            mercury.changeEvent(events.setTodoField),
            mercury.submitEvent(events.add)
        ]
      []
      [ node "h1" [] [] [ text "Todos" ]
      , node "input"
          [ "id"          := "new-todo.new-todo"
          , "placeholder" := "What needs to be done?"
          , "autofocus"   := "true"
          , "value"       := field.text
          , "name"        := "newTodo"
          ]
          []
          []
      ]

mainSection todos route events =
    var allCompleted = todos.every(function (todo) {
        return todo.completed
    })
    var visibleTodos = todos.filter(function (todo) {
        return route === "completed" && todo.completed ||
            route === "active" && !todo.completed ||
            route === "all"
    })

    node "section"
      [ "id" := "main.main" ]
      , "hidden" := bool (isEmpty todos)
      ]
      []
      [ node "input"
          [ "id" := "toggle-all.toggle-all" ]
          [ "type" := "checkbox"
          , "name" := "toggle"
          , "checked" := bool (all .completed todos)
          , "ev-change": mercury.valueEvent(events.toggleAll)
          ]
          []
      , node "label"
          [ "htmlFor" := "toggle-all" ]
          []
          [ text "Mark all as complete" ]
      , node "ul"
          [ "id" := "todo-list.todolist" ]
          []
          (map todoItem (filter isVisible todos))
      ]

todoItem todo events =
    let className = (if todo.completed then "completed " else "") ++
                    (if todo.editing   then "editing"    else "")
    in

    node "li" [ "className" := className, "key" := show todo.id ] []
      [ node "div" [ "className" := "view" ] []
          [ node "input" [ "className" := "toggle" ]
              [ "type" := "checkbox"
              , "checked" := bool todo.completed
              , "ev-change": mercury.event(events.toggle, {
                    id: todo.id,
                    completed: !todo.completed
                })
              ]
              []
          , node "label" [] []
              [ text todo.title ]
                "ev-dblclick": mercury.event(events.startEdit, {
                    id: todo.id 
                })
          , node "button" [ "className" := "destroy" ] [] []
              |> on "click" (mercury.event(events.destroy, { id: todo.id }))
          ]
      , node "input"
          [ "className" := "edit" ]
          [ "value" := todo.title
          , "name" := "title"
          ]
          []
      ]
{-
            "ev-focus": todo.editing ? doMutableFocus() : null,
            "ev-keydown": mercury.keyEvent(events.cancelEdit, ESCAPE, {
                id: todo.id
            }),
            "ev-event": mercury.submitEvent(events.finishEdit, {
                id: todo.id
            }),
            "ev-blur": mercury.valueEvent(events.finishEdit, { id: todo.id })
        })
-}


statsSection todos route events =
    let todosLeft = length (filter .completed todos)
        todosCompleted = length todos - todosLeft
    in
    node "footer" [ "id" := "footer.footer" ] [ "hidden" := bool (isEmpty todos) ]
      [ node "span" [ "id" := "todo-count.todo-count" ] []
          [ node "strong" [] [] [ text todosLeft ]
          , let item_ = if todosLeft == 1 then " item" else " items"
            in  text (item_ ++ " left")
          ]
      , node "ul" [ "id" := "filters.filters" ] []
          [ link("#/", "All", route === "all"),
            link("#/active", "Active", route === "active"),
            link("#/completed", "Completed", route === "completed")
          ]
      , node "button"
          [ "className" := "clear-completed", "id" := "clear-completed" ]
          [ "hidden" := bool (todosCompleted == 0)
          , "ev-click": mercury.event(events.clearCompleted)
          ]
          [ text ("Clear completed (" ++ show todosCompleted ++ ")") ]
      ]

link : String -> String -> Bool -> Html
link uri words isSelected =
    let className = if isSelected then "selected" else "" in
    node "li" [] []
      [ node "a" [ "className" := className, "href" := uri ] [] [ text words ]
      ]

infoFooter : Html
infoFooter =
    node "footer" [ "className" := "info.info" ] []
      [ node "p" [] []
          [ text "Double-click to edit a todo"
          ]
      , node "p" [] []
          [ text "Written by "
          , node "a" [ "href" := "https://github.com/evancz" ] [] [ text "Evan Czaplicki")
          ]
      , node "p" [] []
          [ text "Part of "
          , node "a" [ "href" := "http://todomvc.com" ] [] [ text "TodoMVC" ]
          ]
      ]