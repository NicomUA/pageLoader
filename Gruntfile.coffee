module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('bower.json')
        uglify:
            dist:
                files: ['dist/<%= pkg.name %>.min.js': 'dist/<%= pkg.name %>.js']

        coffee:
            dist:
                files: ['dist/pageLoader.js': 'src/pageLoader.coffee']

        watch:
            coffee:
                files: 'src/*'
                tasks: ['coffee','uglify']

    grunt.loadNpmTasks 'grunt-contrib-uglify';
    grunt.loadNpmTasks 'grunt-contrib-uglify';
    grunt.loadNpmTasks 'grunt-contrib-coffee';
    grunt.loadNpmTasks 'grunt-contrib-watch';

    grunt.registerTask 'default', ['coffee','uglify','watch'];
