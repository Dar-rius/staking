"use client";

import { useAccount, useConnect, useDisconnect } from "wagmi";
import { InjectedConnector } from "wagmi/connectors/injected";

export default function Wallet() {
  const { address, isConnected } = useAccount();
  const { connect } = useConnect({
    connector: new InjectedConnector(),
  });
  const { disconnect } = useDisconnect();
  if (isConnected)
    return (
      <>
        <p>Adresse: {address}</p>
        <button onClick={() => disconnect()}> Disconnected</button>
      </>
    );

  return (
    <>
      <button onClick={() => connect()}>Connect</button>
    </>
  );
}
