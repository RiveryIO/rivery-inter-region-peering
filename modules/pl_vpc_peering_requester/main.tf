### Requester's side of the connection.
data "aws_caller_identity" "current" {}

resource "aws_vpc_peering_connection" "requester" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_region   = var.accepter_region
  auto_accept   = false
  tags = {
    Name = "${var.name}"
    Side = "Requester"
  }
}

### Requestor route
resource "aws_route" "requestor_route_to_accepter" {
  for_each                  = length(var.requester_route_tables) > 0 ? zipmap(var.requester_route_tables, var.requester_route_tables) : {}
  route_table_id            = each.value
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}