let gulp = require('gulp');
let coffee = require('gulp-coffee');

gulp.task('compile-main', function () {
    return gulp.src('src/server/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('./dist'));
});

gulp.task('compile-apis', function () {
    return gulp.src('src/server/apis/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('./dist/apis'));
});

gulp.task('compile-models', function () {
    return gulp.src('src/server/models/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('./dist/models'));
});

gulp.task('compile', ['compile-main', 'compile-apis', 'compile-models']);