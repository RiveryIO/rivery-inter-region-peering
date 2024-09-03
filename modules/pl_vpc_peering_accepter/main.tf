### Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = var.requester_peering_connection_id
  auto_accept               = true
  tags = {
    Name = "${var.name}"
    Side = "Accepter"
  }
}

resource "aws_vpc_peering_connection_options" "acceper" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter.id
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}

### Accepter route
resource "aws_route" "this_accepter_route_to_requester" {
  for_each                  = toset(var.accepter_route_tables)
  route_table_id            = each.value
  destination_cidr_block    = var.requester_cidr
  vpc_peering_connection_id = var.requester_peering_connection_id
}