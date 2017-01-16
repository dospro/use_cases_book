let gulp = require('gulp');
let coffee = require('gulp-coffee');

gulp.task('CompileAll', function () {
    // Backend
    gulp.src("coffeescript/*.coffee")
        .pipe(coffee())
        .pipe(gulp.dest("dist/"));

    // Frontend
    gulp.src("coffeescript/public/**/*.coffee")
        .pipe(coffee())
        .pipe(gulp.dest("public/js/"));

});

gulp.task('CompileFrontend', function () {

    // Frontend
    gulp.src("coffeescript/public/**/*.coffee")
        .pipe(coffee())
        .pipe(gulp.dest("public/js/"));

});

gulp.task('CompileBackend', function () {
    // Backend
    gulp.src("coffeescript/*.coffee")
        .pipe(coffee())
        .pipe(gulp.dest("dist/"));

});