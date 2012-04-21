require File.expand_path "../test_helper", __FILE__

# these tests basically all require a single kinect conntected

context "Kinectaby::Context stuff" do
  setup do
    @context = Kinectaby::Context.new
  end

  test "Initialize and shutdown Kinect" do
    assert @context.shutdown
  end

  test "Count Kinect devices" do
    assert_equal 1, @context.num_devices
  end

  test "Kinect LED constants" do
    assert_equal 0, Kinectaby::LED_OFF
    assert_equal 6, Kinectaby::LED_BLINK_RED_YELLOW
  end

  test "Get first device" do
    device = Kinectaby.device
    assert device
    device.close
  end

  test "Get a device" do
    device = @context.open_device(0)
    device.close
  end

  test "Get no device" do
    assert_raise RuntimeError do
      device = @context.open_device(1)
    end
  end

  test "set led" do
    device = Kinectaby.device
    device.set_led(Kinectaby::LED_RED)
    device.set_led(Kinectaby::LED_BLINK_RED_YELLOW)
    device.led = Kinectaby::LED_GREEN
    device.led = Kinectaby::LED_OFF
    device.close
  end

  test "set tilt" do
    device = Kinectaby.device
    device.tilt = 5
    sleep 1
    assert_equal 0, device.tilt = 0
    sleep 1
    device.close
  end

end
