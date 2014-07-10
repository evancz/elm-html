import Debug
import String
import Html
import Html (..)
import Html.Events (..)
import Html.Optimize.RefEq as Ref
import Window

import Graphics.Input (..)
import Graphics.Input as Input
import Graphics.Input.Field as Field

port title : String
port title = "Elm • TodoMVC"

data Route = All | Completed | Active

type Todo =
    { completed : Bool
    , editing : Bool
    , title : String
    , id : Int
    }

type State =
    { todos : [Todo]
    , route : Route
    , field : Field.Content
    }

actions : Input Action
actions = Input.input NoOp

data Action
    = NoOp
    | Enter
    | Delete Int
    | DeleteComplete
    | Check Int Bool
    | CheckAll Bool
    | ChangeRoute Route

step : Action -> State -> State
step action state =
    case action of
      NoOp -> state
--      Enter -> 
      Delete id ->
          { state | todos <- filter (\t -> t.id /= id) state.todos }

      DeleteComplete ->
          { state | todos <- filter (not . .completed) state.todos }

      Check id isCompleted ->
          let update t = if t.id == id then { t | completed <- isCompleted } else t
          in
              { state | todos <- map update state.todos }

      CheckAll isCompleted ->
          let update t = { t | completed <- isCompleted } in
          { state | todos <- map update state.todos }

      ChangeRoute route ->
          { state | route <- route }

state =
    { todos = [ Todo True False "Buy milk" 1
              , Todo False False "Eat milk" 2
              ]
    , route = All
    , field = Field.noContent
    }

foo = Debug.log "history" <~ foldp (::) [] actions.signal

main = lift2 scene (foldp step state actions.signal) Window.dimensions

scene state (w,h) =
    container w h midTop (Html.toElement 550 h (render state))

render : State -> Html
render state =
    node "div"
      [ "className" := "todomvc-wrapper" ]
      [ "visibility" := "hidden" ]
      [ node "link" [ "rel" := "stylesheet", "href" := "style.css" ] [] []
      , node "section"
          [ "id" := "todoapp" ]
          []
          [ header state
          , mainSection state.route state.todos
          , statsSection state
          ]
      , infoFooter
      ]

onEnter = on "keyup" (keyboardEventIf (\kbdEvent -> kbdEvent.keyCode == 13))

header : State -> Html
header state =
    node "header" 
      [ "id" := "header" ]
      []
      [ node "h1" [] [] [ text "Todos" ]
      , eventNode "input"
          [ "id"          := "new-todo"
          , "placeholder" := "What needs to be done?"
          , "autofocus"   := "true"
          , "value"       := state.field.string
          , "name"        := "newTodo"
          ]
          []
          [ on "input" value actions.handle (always NoOp)
          , onEnter actions.handle (always Enter)
          ]
          []
      ]

mainSection : Route -> [Todo] -> Html
mainSection route todos =
    let isVisible todo =
            case route of
              Completed -> todo.completed
              Active -> not todo.completed
              All -> True

        allCompleted = all .completed todos
    in
    node "section"
      [ "id" := "main" ]
      [ "visibility" := if isEmpty todos then "hidden" else "visible" ]
      [ eventNode "input"
          [ "id" := "toggle-all"
          , "type" := "checkbox"
          , "name" := "toggle"
          , "checked" := bool allCompleted
          ]
          []
          [ onclick actions.handle (\_ -> CheckAll (not allCompleted)) ]
          []
      , node "label"
          [ "htmlFor" := "toggle-all" ]
          []
          [ text "Mark all as complete" ]
      , node "ul"
          [ "id" := "todo-list" ]
          []
          (map todoItem (filter isVisible todos))
      ]

todoItem : Todo -> Html
todoItem todo =
    let className = (if todo.completed then "completed " else "") ++
                    (if todo.editing   then "editing"    else "")
    in

    node "li" [ "className" := className ] []
      [ node "div" [ "className" := "view" ] []
          [ eventNode "input"
              [ "className" := "toggle"
              , "type" := "checkbox"
              , "checked" := bool todo.completed
              ]
              []
              [ onclick actions.handle (\_ -> Check todo.id (not todo.completed)) ]
              []
          , node "label" [] [] [ text todo.title ]
          , eventNode "button" [ "className" := "destroy" ] []
              [ onclick actions.handle (always (Delete todo.id)) ] []

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
    node "footer" [ "id" := "footer" ] [ "hidden" := bool (isEmpty todos) ]
      [ node "span" [ "id" := "todo-count" ] []
          [ node "strong" [] [] [ text (show todosLeft) ]
          , let item_ = if todosLeft == 1 then " item" else " items"
            in  text (item_ ++ " left")
          ]
      , node "ul" [ "id" := "filters" ] []
          [ routeSwap "#/"          All       route
          , routeSwap "#/active"    Active    route
          , routeSwap "#/completed" Completed route
          ]
      , eventNode "button"
          [ "className" := "clear-completed"
          , "id" := "clear-completed"
          ]
          [ "hidden" := bool (todosCompleted == 0) ]
          [ onclick actions.handle (always DeleteComplete) ]
          [ text ("Clear completed (" ++ show todosCompleted ++ ")") ]
      ]

routeSwap : String -> Route -> Route -> Html
routeSwap uri route actualRoute =
    let className = if route == actualRoute then "selected" else "" in
    eventNode "li" [] []
      [ onclick actions.handle (always (ChangeRoute route)) ]
      [ node "a" [ "className" := className, "href" := uri ] [] [ text (show route) ]
      ]

infoFooter : Html
infoFooter =
    node "footer" [ "id" := "info" ] []
      [ node "p" [] []
          [ text "Double-click to edit a todo"
          ]
      , node "p" [] []
          [ text "Written by "
          , node "a" [ "href" := "https://github.com/evancz" ] [] [ text "Evan Czaplicki" ]
          ]
      , node "p" [] []
          [ text "Part of "
          , node "a" [ "href" := "http://todomvc.com" ] [] [ text "TodoMVC" ]
          ]
      ]