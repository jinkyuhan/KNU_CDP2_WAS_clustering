FROM httpd:2.4
COPY ./src/ /usr/local/apache2/htdocs/

RUN apt update \
&& apt -y upgrade \
&& apt install -y vim \
&& apt install -y net-tools

# vim setting
COPY .vimrc /root/.vimrc
COPY ./scripts/vim_setup.sh /root/vim_setup.sh
RUN chmod 755 /root/vim_setup.sh


