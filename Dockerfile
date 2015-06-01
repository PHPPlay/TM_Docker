FROM    tm-qa

WORKDIR /root
ADD     ./checkout-branches ./checkout-branches 
RUN     chmod +x checkout-branches

CMD     ["./checkout-branches"]
