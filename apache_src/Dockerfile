FROM httpd:2.4
LABEL maintainer="cheesecat47@gmail.com"
# COPY ./webcontents/ /usr/local/apache2/htdocs/

# set locales
# RUN locale-gen en_US.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

RUN apt update && apt -y upgrade
RUN apt install -y net-tools

COPY ./src/httpd.conf /usr/local/apache2/conf/httpd.conf

# vim setting
# RUN apt install -y vim
# COPY .vimrc /root/.vimrc
# COPY ./scripts/vim_setup.sh /root/vim_setup.sh
# RUN chmod 755 /root/vim_setup.sh


