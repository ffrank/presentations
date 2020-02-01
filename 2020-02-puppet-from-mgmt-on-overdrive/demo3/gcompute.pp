
gcompute_instance { 'instance-test':
  ensure             => present,
  machine_type       => 'n1-standard-1',
  disks              => [
    { auto_delete => true, boot => true,
      source      => 'instance-test-os-1'
    }
  ],
  metadata           => $metadata_test,
  network_interfaces => $interfaces_test,
  zone               => 'us-central1-a',
  project            => $project,
  credential         => 'mycred',
}
