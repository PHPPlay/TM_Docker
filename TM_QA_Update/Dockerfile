# build using: docker build -t tm-qa .
# run using: docker run -itP tm-qa "./checkout-branch.sh" "Dev" "Dev"

FROM my-tm

ADD ./checkout-branch.sh ./checkout-branch.sh 
RUN chmod +x ./checkout-branch.sh

CMD "echo" "use: docker run -itP tm-qa \"./checkout-branch.sh\" \"{design branch}" \"{graph branch}\" "
