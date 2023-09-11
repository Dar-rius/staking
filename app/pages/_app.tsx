import '@/styles/globals.css'
import type { AppProps } from 'next/app'
import { createConfig,  WagmiConfig} from 'wagmi'
import {foundry} from "wagmi/chains"
import { createPublicClient, http} from 'viem'


export default function App({ Component, pageProps }: AppProps) {
 const config = createConfig({
    autoConnect: true,
    publicClient: createPublicClient({
      chain: foundry,
      transport:http("127.0.0.1:8545")
    })
  })


  return <WagmiConfig config={config}>    
    <Component {...pageProps} />
  </WagmiConfig> 
}
