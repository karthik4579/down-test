FROM rust:latest
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install sudo && sudo apt update && sudo apt upgrade -y

ENTRYPOINT ["/bin/bash"]
