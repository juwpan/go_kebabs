web: rake db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT:-3000}
job: bundle exec rake resque:work QUEUE=*
js: yarn build --watch
css: yarn build:css --watch
