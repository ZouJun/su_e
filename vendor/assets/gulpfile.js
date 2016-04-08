var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var babel = require("gulp-babel");
var rename = require('gulp-rename');
var sourcemaps = require('gulp-sourcemaps');


var paths = {
    'su-ui': ['su-ui/**/*.es6']
};

gulp.task("su-ui-vue", function () {
    return gulp.src(paths['su-ui'])
        .pipe(sourcemaps.init())
        .pipe(babel())
        .pipe(sourcemaps.write())
        .pipe(gulp.dest("su-ui/dist/"))
        .pipe(concat('su-ui.all.js'))
        .pipe(gulp.dest('su-ui/dist'));
});

gulp.task('uglify', function () {
    return gulp.src('su-ui/dist/su-ui.all.js')
        //.pipe(sourcemaps.init())
        .pipe(uglify())
        //.pipe(sourcemaps.write())
        //.pipe(rename({suffix: '.min'}))
        //.pipe(gulp.dest('javascripts/su-ui/'))
        .pipe(concat('su-ui.all.min.js'))
        .pipe(gulp.dest('su-ui/dist'));
});

// Rerun the task when a file changes
gulp.task('watch-all', function () {
    gulp.watch(paths['su-ui'], ['su-ui-vue']);
});
gulp.task('default', ['watch-all']);