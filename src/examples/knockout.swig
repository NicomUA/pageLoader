{% extends "layout.swig" %}
{% set title = 'pageLoader Knockout.js expample page' %}
{% set active = 'knockout' %}

{% block body %}
        <div class="container" >
            <h1 class="text-center">{{ title }}</h1>

            <div id="knockout">
                {% raw %}
                    <div id="todoapp">
                        <header>
                          <input id="new-todo" type="text" placeholder="What needs to be done?" data-bind="value:inputTitle,event: { keyup: createOnEnter}"/>
                        </header>

                        <section id="main" style="display: block;">
                          <div data-bind="visible:todos().length>0">
                              <input id="toggle-all" type="checkbox" data-bind="checked:markAll"/>
                              <label for="toggle-all">Mark all as complete</label>
                          </div>
                          <ul id="todo-list" data-bind="template:{ name:'item-template',foreach: todos}">
                          </ul>
                        </section>

                        <footer style="display: block;">
                          <div data-bind="visible:todos().length>0">
                            <div class="todo-count"><b data-bind="text:todos().length"></b> items left</div>
                            <!-- ko if: doneTodos() > 0 -->
                              <a id="clear-completed" data-bind="click:clear">
                                  Clear <span data-bind="html:countDoneText(true)"></span>.
                              </a>
                            <!-- /ko -->
                            <br style="clear:both"/>
                          </div>
                        </footer>
                    </div>

                    <script type="text/template" id="item-template">
                        <li data-bind="event:{ dblclick :$root.toggleEditMode},css : {done:done() }">
                            <div class="view" >
                              <input class="toggle" type="checkbox" data-bind="checked:done"/>
                              <label data-bind="text:title"></label>
                              <a class="destroy"></a>
                            </div>
                            <input class="edit" type="text" data-bind="value:title,event: { keyup: $root.editOnEnter}" />
                        </li>
                    </script>
                {% endraw %}
            </div>
        </div>
{% endblock %}
