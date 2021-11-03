apiVersion: "tekton.dev/v1beta1"
kind:       "PipelineRun"
metadata: generateName: "ssf-lab-pipelinerun-"
spec: {
	pipelineRef: name: "build-and-deploy-pipeline"
	params: [{
		name:  "gitUrl"
		value: "https://github.com/IBM/tekton-tutorial-openshift"
	}, {
		name:  "pathToYamlFile"
		value: "kubernetes/picalc.yaml"
	}, {
		name:  "imageUrl"
		value: "icr.io/gitsecure/hello-ssf"
	}, {
		name:  "imageTag"
		value: "1.0"
	}]
	serviceAccountName: "pipeline-account"
	workspaces: [{
		name: "git-source"
		volumeClaimTemplate: spec: {
			accessModes: [
				"ReadWriteMany",
			]
			resources: requests: storage: "1Gi"
		}
	}]
}