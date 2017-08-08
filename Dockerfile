# ubuntu:14.04 -- https://hub.docker.com/_/ubuntu/
# |==> phusion/baseimage:0.9.17 -- https://goo.gl/ZLt61q
#      |==> phusion/passenger-ruby22:0.9.17 -- https://goo.gl/xsnWOP
#           |==> HERE
FROM phusion/passenger-ruby22:0.9.17

EXPOSE 80
ENV APP_HOME=/home/app/pact_broker
ENV http_proxy=proxy.pal.sap.corp:8080
ENV https_proxy=proxy.pal.sap.corp:8080
CMD ["/sbin/my_init"]
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD container /

ADD pact_broker/Gemfile $APP_HOME/
ADD pact_broker/Gemfile.lock $APP_HOME/
RUN chown -R app:app $APP_HOME
RUN gem install actionpack -v '4.2.4'
RUN gem install actionview -v '4.2.4'
RUN gem install activemodel -v '4.2.4'
RUN gem install activesupport -v '4.2.4'
RUN gem install json -v '1.8.3'
RUN gem install minitest -v '5.8.1'
RUN gem install mini_portile -v '0.6.2'
RUN gem install httparty -v '0.13.7'
RUN gem install i18n -v '0.7.0'
RUN gem install json -v '1.8.3'
RUN gem install loofah -v '2.0.3'

RUN gem install  mini_portile -v '0.6.2'
RUN gem install  minitest -v '5.8.1'
RUN gem install  multi_json -v '1.11.2'
RUN gem install  multi_xml -v '0.5.5'
RUN gem install  nokogiri -v '1.6.6.2'

RUN gem install  pact  -v '1.9.0'

RUN gem install  pact-mock_service -v '0.7.2'
RUN gem install pact-support -v '0.5.3'
RUN gem install pact_broker -v '1.9.0'
RUN gem install padrino-core -v '0.12.4'
RUN gem install  padrino-support  -v '0.12.4'
RUN gem install passenger -v '5.0.20'
RUN gem install pg -v '0.18.3'
RUN gem install  rack -v '1.6.4'
RUN gem install  rack-protection -v '1.5.3'
RUN gem install rack-test -v '0.6.3'
RUN gem install rails-deprecated_sanitizer -v '1.0.3'
RUN gem install rails-dom-testing -v '1.0.7'
RUN gem install rails-html-sanitizer -v '1.0.2'
RUN gem install rake -v '10.4.2'
RUN gem install randexp -v '0.1.7'
RUN gem install    redcarpet -v '3.3.3'
RUN gem install    reform -v '1.2.6'
RUN gem install representable -v '2.1.8'
RUN gem install roar -v '1.0.3'
RUN gem install rspec -v '3.3.0'
RUN gem install rspec-core -v '3.3.2'
RUN gem install rspec-expectations -v '3.3.1'
RUN gem install rspec-mocks -v '3.3.2'
RUN gem install rspec-support -v '3.3.0'
RUN gem install sequel -v '4.27.0'
RUN gem install    sinatra -v '1.4.6'
RUN gem install term-ansicolor -v '1.3.2'
RUN gem install thor -v '0.19.1'
RUN gem install thread_safe -v '0.3.5'
RUN gem install    tilt -v '2.0.1'
RUN gem install    tins -v '1.6.0'
RUN gem install    trailblazer -v '0.1.2'
RUN gem install tzinfo -v '1.2.2'
RUN gem install uber -v '0.0.15'
RUN gem install    url_mount -v '0.2.1'
RUN gem install versionomy -v '0.4.4'
RUN gem install webmachine -v '1.4.0'
RUN gem install webrick -v '1.3.1'

RUN gem install as-notifications -v '1.0.1'
RUN gem install  multi_json -v '1.11.2'
RUN gem install awesome_print -v '1.6.1'
RUN gem install blockenspiel -v '0.4.5'
RUN gem install builder -v '3.2.2'
RUN gem install diff-lcs -v '1.2.5'
RUN gem install disposable -v '0.0.9'
RUN gem install erubis  -v '2.7.0'
RUN gem install find_a_port  -v '1.0.1'
RUN gem install haml   -v '4.0.7'
RUN gem install http_router   -v '0.11.2'

COPY pact_broker-1.9.4.gem $APP_HOME/
RUN gem install --local $APP_HOME/pact_broker-1.9.4.gem

ADD pact_broker/ $APP_HOME/
RUN rm $APP_HOME/Gemfile.lock
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN chown -R app:app $APP_HOME
