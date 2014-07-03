import Http
import Http (..)

render : State -> Html
render state =
    node "div"
      [ "className" := "todomvc-wrapper" ]
      [ "visibility" := "hidden" ]
      [ node "link" [ rel := "stylesheet", href := "/examples/style.css" ] [] []
      , node "section"
          [ "id" := "todoapp.todoapp" ]
          []
          [ header state
          , mainSection state
          , statsSection state
          ]
      , infoFooter
      ]

header : State -> Html
header state =
    node "header" 
      [ "id" := "header.header" ]
      []
      [ node "h1" [] [] [ text "Todos" ]
      , node "input"
          [ "id"          := "new-todo.new-todo"
          , "placeholder" := "What needs to be done?"
          , "autofocus"   := "true"
          , "value"       := state.field.text
          , "name"        := "newTodo"
          ]
          []
          []
      ]

mainSection : State -> Html
mainSection state =
    let isVisible todo =
            case state.route of
              Completed -> todo.completed
              Active -> not todo.completed
              All -> True
    in
    node "section"
      [ "id" := "main.main"
      , "hidden" := bool (isEmpty state.todos)
      ]
      []
      [ node "input"
          [ "id" := "toggle-all.toggle-all" ]
          [ "type" := "checkbox"
          , "name" := "toggle"
          , "checked" := bool (all .completed state.todos)
          ]
          []
      , node "label"
          [ "htmlFor" := "toggle-all" ]
          []
          [ text "Mark all as complete" ]
      , node "ul"
          [ "id" := "todo-list.todolist" ]
          []
          (map todoItem (filter isVisible state.todos))
      ]

todoItem : Todo -> Html
todoItem todo =
    let className = (if todo.completed then "completed " else "") ++
                    (if todo.editing   then "editing"    else "")
    in

    node "li" [ "className" := className, "key" := show todo.id ] []
      [ node "div" [ "className" := "view" ] []
          [ node "input"
              [ "className" := "toggle" ]
              [ "type" := "checkbox"
              , "checked" := bool todo.completed
              ]
              []
          , node "label" [] [] [ text todo.title ]
          , node "button" [ "className" := "destroy" ] [] []
          ]
      , node "input"
          [ "className" := "edit" ]
          [ "value" := todo.title
          , "name" := "title"
          ]
          []
      ]

statsSection : State -> Html
statsSection {todos,route} =
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
          [ link "#/" "All" (route == All)
          , link "#/active" "Active" (route == Active)
          , link "#/completed" "Completed" (route == Completed)
          ]
      , node "button"
          [ "className" := "clear-completed"
          , "id" := "clear-completed"
          ]
          [ "hidden" := bool (todosCompleted == 0) ]
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