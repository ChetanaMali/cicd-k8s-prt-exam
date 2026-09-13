output "k8s_node_public_ip" {
  description = "Public IP of the k8s-node instance"
  value       = aws_instance.k8s_node.public_ip
}

output "k8s_node_id" {
  description = "Instance ID of k8s-node"
  value       = aws_instance.k8s_node.id
}
