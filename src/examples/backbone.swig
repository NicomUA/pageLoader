{% extends "layout.swig" %}
{% set title = 'pageLoader BackboneJS expample page' %}
{% set active = 'backbone' %}

{% block 'extra_js' %}
    <script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.7.0/underscore.js" defer></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone.js" defer></script>
{% endblock %}

{% block body %}
        <link rel="stylesheet" href="http://raw.githubusercontent.com/jeromegn/Backbone.localStorage/master/examples/todos/todos.css"/>

        <div class="container" >
            <h1 class="text-center">{{ title }}</h1>

            {% raw %}
            <div id="todoapp">

                <header>
                    <input id="new-todo" type="text" placeholder="What needs to be done?">
                </header>

                <section id="main">
                    <input id="toggle-all" type="checkbox">
                    <label for="toggle-all">Mark all as complete</label>
                    <ul id="todo-list"></ul>
                </section>

                <footer>
                    <a id="clear-completed">Clear completed</a>
                    <div id="todo-count"></div>
                </footer>

            </div>

            <div id="instructions"> Double-click to edit a todo. </div>

            <!-- Templates -->
            <script type="text/template" id="item-template">
                <div class="view">
                    <input class="toggle" type="checkbox" <%= done ? 'checked="checked"' : '' %> />
                    <label><%- title %></label>
                    <a class="destroy"></a>
                </div>

                <input class="edit" type="text" value="<%- title %>" />
            </script>

            <script type="text/template" id="stats-template">
                <% if (done) { %>
                    <a id="clear-completed">Clear <%= done %> completed <%= done == 1 ? 'item' : 'items' %></a>
                <% } %>

                <div class="todo-count"><b><%= remaining %></b> <%= remaining == 1 ? 'item' : 'items' %> left</div>
            </script>
            {% endraw %}
        </div>
{% endblock %}
