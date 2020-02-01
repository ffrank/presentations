
ec2_instance { 'name-of-instance':
  ensure            => running,
  region            => 'us-east-1',
  availability_zone => 'us-east-1a',
  image_id          => 'ami-123456',
  instance_type     => 't2.micro',
  key_name          => 'name-of-existing-key',
  subnet            => 'name-of-subnet',
  security_groups   => ['name-of-security-group'],
  tags              => {
    tag_name => 'value',
  },
}
