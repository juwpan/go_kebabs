# web: rake db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT:-3000}
# job: bundle exec rake resque:work QUEUE=*

web: bundle exec rails server
worker: QUEUE=* bundle exec rake environment resque:work
js: yarn build --watch
css: yarn build:css --watch
