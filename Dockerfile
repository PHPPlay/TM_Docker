FROM    tm-tm

ADD     ./checkout-branches ./checkout-branches
RUN     chmod +x checkout-branches

CMD     ["./checkout-branches"]
