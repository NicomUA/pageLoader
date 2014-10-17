{% extends "layout.swig" %}
{% set title = 'pageLoader angular init expample page' %}
{% block body %}
        <div class="container" >
            <h1>{{ title }}</h1>

            {% raw %}
            <div id="angular">
                <div ng-controller="PhoneListCtrl">
                    <pre> {{ phones | json }} </pre>
                    <ul>
                        <li ng-repeat="phone in phones"> {{ phone.name }} <p>{{ phone.snippet }}</p> </li>
                    </ul>
                </div>
            </div>
            {% endraw %}
        </div>
{% endblock %}
