FROM python:3.4.5-alpine


COPY marathon-autoscale.py requirements.txt /app/
RUN pip3 install -r /app/requirements.txt
ENV max-mem-percent "85"
ENV max-cpu-time "85"
ENV trigger-mode "or"
ENV autoscale-multiplier "1.5"
ENV max-instances "4"
CMD ["/bin/sh", "-c" , "python /app/marathon-autoscale.py --marathon-host $marathon-host \
	--marathon-app $marathon-app \
	--max-mem-percent $max-mem-percent \
	--max-cpu-time $max-cpu-time \
	--trigger-mode $trigger-mode \
	--autoscale-multiplier $autoscale-multiplier \
	--max-instances $max-instances" ]