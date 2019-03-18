podTemplate(label: 'docker-bitcoinsv', containers: [
  containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat', envVars: [
    envVar(key: 'DOCKER_HOST', value: 'tcp://docker-host-docker-host:2375')
  ])
]) {
  node('docker-bitcoinsv') {
    stage('Build Image') {
      container('docker') {
        def scmVars = checkout scm
        sh "docker build -t santiment/bitcoinsv:${VERSION_MINOR} -t santiment/bitcoinsv:${VERSION} ."

        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
            sh "docker push santiment/bitcoinsv:${VERSION_MINOR}"
            sh "docker push santiment/bitcoinsv:${VERSION}"
          }
        }
      }
    }
  }
}
