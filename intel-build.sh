# -- Software Stack Version

SPARK_VERSION="3.0.0"
HADOOP_VERSION="2.7"
JUPYTERLAB_VERSION="2.1.5"

# -- Building the Images

docker build \
  -f intel-cluster-base.Dockerfile \
  -t thaibigdata/intel-cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f intel-spark-base.Dockerfile \
  -t thaibigdata/intel-spark-base .

docker build \
  -f intel-spark-master.Dockerfile \
  -t thaibigdata/intel-spark-master .

docker build \
  -f intel-spark-worker.Dockerfile \
  -t thaibigdata/intel-spark-worker .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f intel-jupyterlab.Dockerfile \
  -t thaibigdata/intel-jupyterlab .
