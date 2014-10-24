<!DOCTYPE html>
<html>

    <head>
        <title>{{ title| default('pageLoader') }}</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    </head>

    <body>
        <div class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="./index.html">pageLoader</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="{% if active == 'home' %}active{% endif %}"><a href="./index.html">Home</a>
                        <li class="{% if active == 'jquery' %}active{% endif %}"><a href="./jquery.html">jQuery UI</a>
                        <li class="{% if active == 'angular' %}active{% endif %}" ><a href="./angular.html">Angular</a> </li>
                        <li class="{% if active == 'backbone' %}active{% endif %}" ><a href="./backbone.html">Backbone</a> </li>
                        <li class="{% if active == 'knockout' %}active{% endif %}" ><a href="./knockout.html">Knockout</a> </li>
                    </ul>
                </div>
            </div>
        </div>

        {% block body %}{% endblock %}

        <script src="../libs/jquery/dist/jquery.min.js"></script>
        <script src="../dist/pageLoader.js" data-config="./js/config.js"></script>

        {% block 'extra_js' %}{% endblock %}
    </body>
</html>
