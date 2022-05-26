$mySubscriptionId = 'c064671c-8f74-4fec-b088-b53c568245eb'
$myResourceGroup = 's1161088'
$myLocation = 'westeurope'
$myScaleSet1 = 'myScaleSetWeb'
$myScaleSet2 = 'myScaleSetApp'
$myScaleSet3 = 'myScaleSetData'
$myScaleSet4 = 'myScaleSetTax'
$vNetName = 'myVnet'
$publicIpAddressNameWeb = 'myPublicIpAddressWeb'
$publicIpAddressNameApp = 'myPublicIpAddressApp'
$publicIpAddressNameData = 'myPublicIpAddressData'
$publicIpAddressNameTax = 'myPublicIpAddressTax'
$loadBalancerNameWeb = 'myLoadBalancerWeb'
$loadBalancerNameApp = 'myLoadBalancerApp'
$loadBalancerNameData = 'myLoadBalancerData'
$loadBalancerNameTax = 'myLoadBalancerTax'

$subnetWeb = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Web' -AddressPrefix '10.0.1.0/24'
$subnetData = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Data' -AddressPrefix '10.0.2.0/24'
$subnetApp = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-App' -AddressPrefix '10.0.3.0/24'
$subnetTax = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Tax' -AddressPrefix '10.0.4.0/24'
$vNet = New-AzVirtualNetwork -ResourceGroupName $myResourceGroup -Name $vNetName -AddressPrefix '10.0.0.0/16' `
  -Location $myLocation -Subnet $subnetWeb, $subnetData, $subnetApp, $subnetTax

New-AzVmss `
  -ResourceGroupName "$myResourceGroup" `
  -Location "$myLocation" `
  -VMScaleSetName "$myScaleSet1" `
  -VirtualNetworkName "$vNetName" `
  -SubnetName 'MySubnet-Web' `
  -PublicIpAddressName "$publicIpAddressNameWeb" `
  -LoadBalancerName "$loadBalancerNameWeb" `
  -UpgradePolicyMode "Automatic" `
  -Zone "1", "2"

New-AzVmss `
  -ResourceGroupName "$myResourceGroup" `
  -Location "$myLocation" `
  -VMScaleSetName "$myScaleSet2" `
  -VirtualNetworkName "$vNetName" `
  -SubnetName 'MySubnet-Data' `
  -PublicIpAddressName "$publicIpAddressNameApp" `
  -LoadBalancerName "$loadBalancerNameApp" `
  -UpgradePolicyMode "Automatic" `
  -Zone "1", "2"

New-AzVmss `
  -ResourceGroupName "$myResourceGroup" `
  -Location "$myLocation" `
  -VMScaleSetName "$myScaleSet3" `
  -VirtualNetworkName "$vNetName" `
  -SubnetName 'MySubnet-App' `
  -PublicIpAddressName "$publicIpAddressNameData" `
  -LoadBalancerName "$loadBalancerNameData" `
  -UpgradePolicyMode "Automatic" `
  -Zone "1", "2"

New-AzVmss `
  -ResourceGroupName "$myResourceGroup" `
  -Location "$myLocation" `
  -VMScaleSetName "$myScaleSet4" `
  -VirtualNetworkName "$vNetName" `
  -SubnetName 'MySubnet-Tax' `
  -PublicIpAddressName "$publicIpAddressNameTax" `
  -LoadBalancerName "$loadBalancerNameTax" `
  -UpgradePolicyMode "Automatic" `
  -Zone "1", "2"