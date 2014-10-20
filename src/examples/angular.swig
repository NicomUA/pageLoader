{% extends "layout.swig" %}
{% set title = 'pageLoader Angular.js ToDo List expample page' %}
{% set active = 'angular' %}

{% block body %}
        <div class="container" >
            <h1 class="text-center">{{ title }}</h1>

            <div id="angular" ng-controller="TodoCtrl">
                {% raw %}
                	<section class="app-body">
                		<section class="archive-control">
                			<span>{{ remaining() }} of {{ todos.length }} remaining</span>
                			<p>[ <a href="" data-ng-click="archive()">Remove Completed Items</a> ]</p>
                		</section>

                		<ul class="unstyled angular">
                			<li class="angular" data-ng-repeat="todo in todos track by $index">
                				<input type="checkbox" data-ng-model="todo.done">
                				<span class="done-{{ todo.done }}">{{ todo.text }}</span>
                			</li>
                		</ul>

                		<form data-ng-submit="addTodo()" class="todo-form">
                			<input type="text" data-ng-model="todoText" placeholder="Enter new ToDo item" class="angular"/>
                			<br />
                			<input type="submit" value="Add Task" class="angular"/>
                		</form>
                    </section>
                {% endraw %}
            </div>
        </div>
{% endblock %}
