module.exports = function(grunt) {
	// load all grunt tasks matching the `grunt-*` pattern
    require('load-grunt-tasks')(grunt);

	grunt.initConfig({
		coffee: {
			compile: {
			    files: {
			      	'app/js/app.js': ['app/coffee/built.coffee']
			    }
			}
		},
		concat: {
		    coff: {
		      src: [
		      		'app/coffee/app.coffee',
		      		'app/coffee/config.coffee',
		      		'app/coffee/services/*.coffee',
		      		'app/coffee/controllers/*.coffee'
		      		
		      ],
		      dest: 'app/coffee/built.coffee',
		    },
		    css: {
		      src: [
		      		'libs/bootstrap/dist/css/bootstrap.min.css',
		      		'libs/bootstrap/dist/css/bootstrap-theme.min.css'
		      ],
		      dest: 'public/css/built.css',
		    },
		},
		watch: {
		  scripts: {
		    files: ['app/coffee/**/*.coffee'],
		    tasks: ['concat', 'coffee'],
		    options: {
		      spawn: false,
		    },
		  },
		},

	});

	grunt.registerTask('default', ['watch']);
}
