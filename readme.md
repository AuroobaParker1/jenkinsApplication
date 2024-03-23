1. Install gcloud
2. Login into glcoud

   `gcloud auth application-default login` &
   `gcloud auth login`

3.

gcloud components install gke-gcloud-auth-plugin

gcloud container clusters get-credentials demo-cluster-s --region=us-central1-c

kubectl create secret generic app-secret --from-env-file=.env
