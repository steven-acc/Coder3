FROM codercom/code-server:4.4.0

USER root

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash \
  && sudo apt-get install -y nodejs
EXPOSE 8080
# CMD ["dumb-init", "code-server", "--auth", "none", "--port", "8081", "--host", "0.0.0.0"]
ENTRYPOINT ["dumb-init" "fixuid" "-q" "/usr/local/bin/code-server" "--port" "8080" "--host" "0.0.0.0" "."]
# ENTRYPOINT ["/usr/bin/entrypoint.sh" "--bind-addr" "0.0.0.0:8080" "."]
