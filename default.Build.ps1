$ImageName = "fgauna12/gaunaloadyou:latest"

task DockerBuild{
    exec { 
        docker build -t $ImageName .
    }
}

task DockerPush {
    exec {
        az acr login -n nebbiaregistry

        docker push $ImageName
    }
}

task . DockerBuild