FROM gcc:latest
RUN git clone https://github.com/droberson/ssh-honeypot.git
WORKDIR /ssh-honeypot/
RUN apt-get update
RUN apt-get install libssh-dev -y
RUN make
RUN ssh-keygen -t rsa -f ./ssh-honeypot.rsa
#RUN bin/ssh-honeypot -r ./ssh-honeypot.rsa
EXPOSE 22
ENTRYPOINT [bin/ssh-honeypot]
CMD ["-r ./ssh-honeypot.rsa -p 22 -u nobody"]
