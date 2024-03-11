pipeline {
  agent {

    docker {
      image 'vadimkorovinsky/lec11hw:latest'
      args '-v /var/run/docker.sock:/var/run/docker.sock' 
    }
    
  }
  
  stages {
    stage('Upload source projoct from git') {
      steps {
        git(url: 'https://github.com/koddas/war-web-project.git', branch: 'master', poll: true, credentialsId: 'git')
      }
    }
    
    stage('Build war file') {
      steps {
        sh 'mvn clean package'
      }
    }
    
    stage('Build docker file') {
      steps {
        git(url: 'https://github.com/vadimkorovinsky/lec11hw.git', branch: 'master', poll: true, credentialsId: 'git')
        sh 'docker build -t vadimkorovinsky/webapp:1.0 .'
        withDockerRegistry(credentialsId: 'ee071ccc-68c0-4c00-8279-fb979b1c4585', url: 'https://index.docker.io/v1/') {
        }
      }
    }
    
    stage('Push docker file') {
      steps {
        withDockerRegistry(credentialsId: 'ee071ccc-68c0-4c00-8279-fb979b1c4585', url: 'https://index.docker.io/v1/') {
            sh 'docker push vadimkorovinsky/webapp:1.0'
        }     
      }
    }
  }
}
