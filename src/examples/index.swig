{% extends "layout.swig" %}
{% set active = 'home' %}

{% block body %}
    <div class="container theme-showcase" role="main">
        <div class="jumbotron">
            <h1>pageLoader examples</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            </p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <a href="./jquery.html" class="btn btn-warning btn-lg btn-block">jQuery</a>
            </div>
            <div class="col-md-4">
                <a href="./angular.html" class="btn btn-danger btn-lg btn-block">AngularJS (beta)</a>
            </div>
            <div class="col-md-4">
                <a href="./backbone.html" class="btn btn-primary btn-lg btn-block">BackboneJS (beta)</a>
            </div>

            <div class="col-md-4">
                <a href="./knockout.html" class="btn btn-warning btn-lg btn-block" style="background-color: #CF5300;">Knockout</a>
            </div>

        </div>
    </div>
{% endblock %}
