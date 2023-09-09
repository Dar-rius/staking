"use client";
import "./style/globals.css";
import { Inter } from "next/font/google";
import { createConfig, WagmiConfig, configureChains } from "wagmi";
import { http, createPublicClient } from "viem";
import { foundry } from "wagmi/chains";
import { jsonRpcProvider } from "@wagmi/core/providers/jsonRpc";
import { InjectedConnector } from '@wagmi/core/connectors/injected'

const inter = Inter({ subsets: ["latin"] });

const { chains, publicClient } = configureChains(
  [foundry],
  [
    jsonRpcProvider({
      rpc: (chain) => ({
        http: `http://127.0.0.1:8545`,
      }),
    }),
  ],
)

const config = createConfig({
  autoConnect: true,
  connectors: [new InjectedConnector({ chains })],
  publicClient
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <WagmiConfig config={config}>{children}</WagmiConfig>
      </body>
    </html>
  );
}
