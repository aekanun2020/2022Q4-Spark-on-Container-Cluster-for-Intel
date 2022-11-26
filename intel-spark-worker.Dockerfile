ARG spark_version
FROM thaibigdata/intel-spark-base:latest
LABEL manteiner="aekanunbigdata@gmail.com"

# -- Layer: Image Metadata

ARG build_date

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Apache Spark Spark Multi-nodes Standalone Cluster on Docker - Spark Worker Image"
LABEL org.label-schema.description="Spark worker image"
LABEL org.label-schema.url="http://www.aekanun.com"
LABEL org.label-schema.schema-version="1.0"

# -- Runtime

EXPOSE 8081

CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out
