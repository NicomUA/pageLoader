module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('bower.json')
        uglify:
            dist:
                files: ['dist/pageLoader.min.js': 'dist/pageLoader.js']

        coffee:
            dist:
                files: ['dist/pageLoader.js': 'src/pageLoader.coffee']

        swig:
            dist:
                generateSitemap: false,
                generateRobotstxt: false,
                dest: "."
                src: ['src/examples/*.swig','!src/examples/layout.swig']


        watch:
            coffee:
                files: 'src/*'
                tasks: ['coffee','uglify']


            swig:
                files: 'src/examples/*'
                tasks: ['swig']


    grunt.loadNpmTasks 'grunt-contrib-uglify';
    grunt.loadNpmTasks 'grunt-contrib-coffee';
    grunt.loadNpmTasks 'grunt-swig';
    grunt.loadNpmTasks 'grunt-contrib-watch';

    grunt.registerTask 'default', ['coffee','uglify','swig','watch'];
